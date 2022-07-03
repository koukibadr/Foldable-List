
#  Foldable List

  

An animated foldable list cells with dynamic widget list input, let you display detailed item cell without navigating to a new screen.

| ![enter image description here](https://github.com/koukibadr/Foldable-List/blob/main/example/foldable_list_scale_animation.gif?raw=true) | ![foldable_list_slide_animation.gif](https://github.com/koukibadr/Foldable-List/blob/main/example/foldable_list_slide_animation.gif?raw=true) | ![foldable_list_without_animation.gif](https://github.com/koukibadr/Foldable-List/blob/main/example/foldable_list_without_animation.gif?raw=true) |
|--|--|--|

##  Features

- Display list of widgets
- Display detailed cell item
- Animation transition between item cell and foldable item

##  Getting Started

In order to use foldable list package you need to install it via `pubspec.yaml` file
```yaml
dependencies:
	foldable_list: ^1.0.1
```

##  Parameters

| **Name** | **Type** | **Description** | **Required** |
|--|--|--|--|
| foldableItems | `List<Widget>` | List of widget items that will be shown when an item is clicked | True |
| items| `List<Widget>` | List of widgets that will be shown by default in the listview | True |
| animationDuration| Duration | the duration of the animation by default: `Duration(milliseconds:  500)` | False |
| animationType| `ANIMATION_TYPE` | the animation that will applied on the transition between items | False |

possible values of `animationType` : `NONE, SIZE_TRANSITION, SCALE`


##  Example

```dart
return  Scaffold(
	backgroundColor:  Colors.white,
	body:  Container(
		child:  FoldableList(
			animationType:  ANIMATION_TYPE.NONE,
			foldableItems:  this.expandedWidgetList,
			items:  this.simpleWidgetList
		)
	)
);
```
Result:

![foldable_list_without_animation.gif](https://github.com/koukibadr/Foldable-List/blob/main/example/foldable_list_without_animation.gif?raw=true)

##  Contribution

Of course the project is open source, and you can contribute to it [repository link](https://github.com/koukibadr/Foldable-List)

- If you **found a bug**, open an issue.

- If you **have a feature request**, open an issue.

- If you **want to contribute**, submit a pull request.