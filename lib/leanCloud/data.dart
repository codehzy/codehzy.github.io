import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';

class Data extends StatelessWidget {
  const Data({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 数据写入
    void Save() async {
      LeanCloud.initialize(
          'dkaJmPAQtIrw6PvXIp92AEdy-gzGzoHsz', 'D6kmuNVJVS5JKRlYpF4YhL12',
          server: 'https://dkajmpaq.lc-cn-n1-shared.com',
          // to use your own custom domain
          queryCache: new LCQueryCache() // optinoal, enable cache
          );

      // 构建对象
      LCObject todo = LCObject("Todo");
      // 为属性赋值
      todo['title'] = '马拉松报名';
      todo['priority'] = 2;
      // 将对象保存到云端
      await todo.save();
      print('数据写入成功');
    }

    /// 数据获取
    void Get() async {
      try {
        LCQuery<LCObject> query = LCQuery('Todo');
        LCObject todo = await query.get('60adb096af69b647bd0f065d');
        // todo 就是 objectId 为 582570f38ac247004f39c24b 的 Todo 实例
        String title = todo['title'];
        int priority = todo['priority'];

        // 获取内置属性
        String objectId = todo.objectId;
        DateTime updatedAt = todo.updatedAt;
        DateTime createdAt = todo.createdAt;

        var data = [];
        data.add(title);
        data.add(priority);
        print('${data}');
      } catch (err) {
        print('获取数据失败,注意id');
      }
    }

    /// 数据更新
    void Update() async {
      // 更新对象
      // LCObject todo =
      //     LCObject.createWithoutData('Todo', '60adb096af69b647bd0f065d');
      // todo['title'] = '这周周会改到周三下午三点。';
      // await todo.save();
      // print('数据更新成功');

      // 数组更新
      /**
       * add(key, value)
          将指定对象附加到数组末尾。
          addAll(key, values)
          将一组对象附加到数组末尾。
          addUnique(key, value)
          将指定对象附加到数组末尾，确保对象唯一。
          addAllUnique(key, values)
          将指定对象数组附加到数组末尾，确保对象唯一。
          remove(key, value)
          从数组字段中删除指定对象的所有实例。
          removeAll(key, values)
          从数组字段中删除指定的对象数组。
       * */
      DateTime alarm1 = DateTime.parse('2018-04-30 07:10:00Z');
      DateTime alarm2 = DateTime.parse('2018-04-30 07:20:00Z');
      DateTime alarm3 = DateTime.parse('2018-04-30 07:30:00Z');

      LCObject todo = LCObject("Todo");
      todo.addAllUnique('alarms', [alarm1, alarm2, alarm3]);
      await todo.save();
      print('数组写入成功');
    }

    /// 删除对象
    void Delete() async {
      LCObject todo =
          LCObject.createWithoutData('Todo', '60adb38faf69b647bd0f1031');
      await todo.delete();
      print('删除数据成功');
    }

    /// 批量操作
    void Batch() async {
      LCQuery<LCObject> query = LCQuery('Todo');
      List<LCObject> results = await query.find();
      // 获取需要更新的 todo
      for (LCObject todo in results) {
        // 更新属性值
        todo['isComplete'] = false;
      }

      await LCObject.saveAll(results);
      print('批量操作成功');
    }

    /// 数据模型 一对一或一对多
    void ObjectIn() async {
      // 方法一
      // // 创建 post
      // LCObject post = LCObject("Post");
      // post['title'] = '饿了……';
      // post['content'] = '中午去哪吃呢?';
      //
      // // 创建 comment
      // LCObject comment = LCObject("Comment");
      // comment['content'] = '当然是肯德基啦!';
      //
      // // 将 post 设为 comment 的一个属性值
      // comment['parent'] = post;
      //
      // // 保存 comment 会同时保存 post
      // await comment.save();
      // print('数据模型更新成功方法一');

      // 方法二
      // 创建 post
      LCObject post =
          LCObject.createWithoutData('Post', '60adb73aaf69b647bd0f1963');
      post['title'] = '饿了……';
      post['content'] = '中午去哪吃呢?';

      // 创建 comment
      LCObject comment = LCObject("Comment");
      comment['content'] = '当然是肯德基啦!';

      comment['post'] = post;

      // 保存 comment 会同时保存 post
      await comment.save();
      print('数据模型更新成功方法二');
    }

    /// 序列化 & 反序列化
    /// TODO：文档阅读
    void Seq() async {
      LCObject object = LCObject('Hello');
      object['title'] = '马拉松报名';
      object['priority'] = 2;
      object['owner'] = LCUser.getCurrent();
      String serializedString = object.toString();
      print('序列化数据:${serializedString}');

      // LCObject newObject = LCObject('newObject');
      LCObject newObject = LCObject.parseObject(serializedString);
      print('${newObject['title']}');
      print('反序列化数据:${newObject}');

      await newObject.save();
      print('序列化和反序列化成功');
    }

    /// 数据查询 LCQuery

    return Scaffold(
      appBar: AppBar(
        title: Text('数据操作'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                FlatButton(
                    onPressed: () {
                      Save();
                    },
                    color: Colors.blue,
                    child: Text('数据插入')),
                FlatButton(
                    onPressed: () {
                      Get();
                    },
                    color: Colors.blue,
                    child: Text('数据读取')),
                FlatButton(
                    onPressed: () {
                      Update();
                    },
                    color: Colors.blue,
                    child: Text('数据更新')),
                FlatButton(
                    onPressed: () {
                      Delete();
                    },
                    color: Colors.blue,
                    child: Text('删除数据')),
                FlatButton(
                    onPressed: () {
                      Batch();
                    },
                    color: Colors.blue,
                    child: Text('批量操作')),
                FlatButton(
                    onPressed: () {
                      ObjectIn();
                    },
                    color: Colors.blue,
                    child: Text('数据模型')),
                FlatButton(
                    onPressed: () {
                      Seq();
                    },
                    color: Colors.blue,
                    child: Text('序列化和反序列化有问题')),
              ],
            ),
            Center(
              child: Column(
                children: [
                  FlatButton(color: Colors.black, child: Text('分隔')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
