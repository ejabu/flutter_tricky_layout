**1. Use DropdownButtonFormField**

As for me, I rather choose to **replace** `Dropdown` widget with `DropdownButtonFormField`


change this

``` dart
child: ListTile(
  dense: true,
  title: Text(
    "Contact Name",
    style: TextStyle(fontWeight: FontWeight.bold),
  ),
  subtitle: DropdownButton<int>( // change this
    items: [
      ...
```

into this

``` dart

child: ListTile(
  dense: true,
  title: Text(
    "Contact Name",
    style: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),
  subtitle: DropdownButtonFormField<int>( // into this
    decoration: InputDecoration(
      isDense: true,
      hasFloatingPlaceholder: true,
      labelText: 'Select Contact Name',
      contentPadding: EdgeInsets.symmetric(vertical: 9),
    ),
    items: [
      ...
```

**2. Remove hint params**

secondly, as we move **'Select Contact name'** to `label Text` inside InputDecoration, we can remove these lines :


``` dart
hint: Text(
  "Select Contact Name",
  style: TextStyle(
    color: Colors.black,
  ),
),
```          
**3. Comparison**

We can discover three options that we already have in image below.

1. at the first row, it is solution proposed by KeykoYume
2. at the second row, it is solution proposed by Abhilash Chandran
3. at the last row, it is **new solution** proposed by me

[![Debug Painting enabled][1]][1]
[![Final result][2]][2]


  [1]: https://i.stack.imgur.com/j3XyN.png
  [2]: https://i.stack.imgur.com/evoum.png