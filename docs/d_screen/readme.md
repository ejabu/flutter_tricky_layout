

## Button Triggered Animation

### 1. Setup Animation within initState

differs from many tutorial around, I suggest to put new function named setupAnimation which covers initial setup relates to animation

this is the first code structure we will have :

``` dart
class BuilderAuto extends StatefulWidget { // Mandatory : Stateful
  @override
  _BuilderAutoState createState() => _BuilderAutoState();
}

class _BuilderAutoState extends State<BuilderAuto>
    with SingleTickerProviderStateMixin { // Mandatory : inherit this class

  static AnimationController controller; // create class properties

  @override
  void initState() {
    super.initState();
    setupAnimation(); // wrap our initialization here
  }

  void setupAnimation() {
    // We initialize how many seconds will `some value` changes
    // and put it on some AnimationController which we may
    // control later, whether to increase `the value`, or decrease
    // `the value`
    
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    controller.forward();
  }

```



### 2. Create some 'value' which ranges from some beginning Value to some ending Value

*later we will have this line of code*

``` dart
final animation = Tween<double>(begin: 0, end: 1)
```

**What does this mean ?**

* we will have some 'value' called animation. 
* this value may changes *down to 0*
* this value may changes *up to 1*
* if this value increases, it will increase linearly
* if this value decreases, it will decrease linearly

**Why does it matter ?**

We will use this value, as a **reference** for our **moving object animation**

To move *an object* for 2 secs, we can have simple scenario like this :

* Initially, it is on x : 0, and y: 0 coordinate
* after 1s, it is on x : 50, and y : 30 coordinate
* Finally, it is on x : 100, and y : 60 coordinate

So, we can utilize **animation value** above which linearly changes.

### 3. How to start changing some 'value' ?

*later we will extend this*

``` dart
final animation = Tween<double>(begin: 0, end: 1)
```

*to this*

``` dart
final animation = Tween<double>(begin: 0, end: 1).animate(controller)
```

**then to increase its value**

``` dart
controller.forward();
```

**then to decrease its value**

``` dart
controller.reverse();
```


### 4. Why we need to use controller ?


because, simply in this very part, we define its Duration. So some 'value'
will understand how much time it takes to maximize and minimize its value.

``` dart
controller = AnimationController(
  duration: const Duration(seconds: 2),
  vsync: this,
);
```

### 5. What to modify from original code ?

for your code :

**we need to change this build method**

``` dart
AnimatedBuilder(
  animation: _controller,
  child: Stack(
    children: <Widget>[
      DragObject(image: 'image/w1.png',position: post1,dataName: 't1',dataColor: Colors.blue,textField:null),
    ],
  ),
  builder: (BuildContext context, Widget child){
    return Transform.translate(
      offset: Offset.zero, // this should be modified time-by-time.
      child: child,
    );
  },
),
```

**to this build method**

``` dart
  Widget build(BuildContext context) {
    final animation = Tween<double>(begin: 0, end: 1).animate(controller);
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Triggered'),
      ),
      body: AnimatedBuilder(
        animation: animation,
        child: Stack(
          children: <Widget>[
            DragObject(image: 'image/w1.png',position: post1,dataName: 't1',dataColor: Colors.blue,textField:null),
          ],
        ),
        builder: (BuildContext context, Widget child) {
          final xPos = 100 * animation.value;
          final yPos = 60 * animation.value;
          return Transform.translate(
            offset: Offset(xPos, yPos),
            child: child,
          );
        },
      ),
    );
  }
```


### 6. For Full Working-example

You can look at [this repo]()

[![Demo][1]][1]


  [1]: https://i.stack.imgur.com/ZmjtG.gif
