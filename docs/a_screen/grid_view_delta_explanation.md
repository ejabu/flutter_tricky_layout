### 1. Identify Problem

```dart
new ListView(
  children: [
    new Image.asset(
      'images/slider/img_s1.jpg',
      width: 600.0,
      height: 180.0,
      fit: BoxFit.fill,
    ),
    homeIcon,
    grid // this is the problem
  ],
),
```

the problem is here. because grid is defined as GridView Widget, Flutter cannot
renders it as children of ListView.

``` dart
Widget grid = GridView.count(
      crossAxisCount: 4,
...
```

### 2. But I want the screen to be scrollable as well ?

To Do That. We need to replace SingleChildScrollView or similiar widget, e.g ListView. **We change it into CustomScrollView**.

This is necessary because actually Flutter recognise two pattern : 
* List View pattern
children will be added in vertical direction
* Grid Box pattern
children will be added Z direction. If it has two column, its 1st and 2nd children will be rendered on First Row. then its second row rendered with 3rd and 4th.

**Official Docs**

[![CustomScroll][1]][1]


  [1]: https://i.stack.imgur.com/Qajyq.png



### 3. How to write that section ?

``` dart
body: CustomScrollView(
  slivers: <Widget>[ // rather than children, it is named slivers
    // List Pattern section
    SliverList(
      delegate : // rather than children, it is named delegate
      ...
    ),
    // Grid Pattern section
    SliverGrid(
      delegate : // rather than children, it is named delegate
      ...
    ),
    
  ],
)
```


### 4. Final Code

* Changed `ListView` to `SliverList` to make a **List Section**
* Wrap it with `CustomScrollView`
* Put `SliverGrid` below `SliverList`, which is our **Grid Section**
* Render our **grid** variable, inside SliverGrid


``` dart
body: new ListView( // replace this to SliverList
  children: [
    new Image.asset(
      'images/slider/img_s1.jpg',
      width: 600.0,
      height: 180.0,
      fit: BoxFit.fill,
    ),
    homeIcon,
    grid // needs to be moved into our Grid Section 

  ],
),
```

``` dart
body: CustomScrollView(
  slivers: <Widget>[
    // This is our List Section
    SliverList(
      delegate: SliverChildListDelegate([
        Image.asset(
          'images/slider/img_s1.jpg',
          width: 600.0,
          height: 180.0,
          fit: BoxFit.fill,
        ),
        homeIcon,
        // grid
      ]),
    ),
    // This is our Grid Section
    SliverGrid.count(
      children: <Widget>[grid],
      crossAxisCount: 1,
    ),
  ],
),
```