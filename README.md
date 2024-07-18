
# react-native-laundry-gz-clothes-cleaning

## Getting started

`$ npm install react-native-laundry-gz-clothes-cleaning --save`

### Mostly automatic installation

`$ react-native link react-native-laundry-gz-clothes-cleaning`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-laundry-gz-clothes-cleaning` and add `RNLaundryGzClothesCleaning.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNLaundryGzClothesCleaning.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNLaundryGzClothesCleaningPackage;` to the imports at the top of the file
  - Add `new RNLaundryGzClothesCleaningPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-laundry-gz-clothes-cleaning'
  	project(':react-native-laundry-gz-clothes-cleaning').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-laundry-gz-clothes-cleaning/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-laundry-gz-clothes-cleaning')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNLaundryGzClothesCleaning.sln` in `node_modules/react-native-laundry-gz-clothes-cleaning/windows/RNLaundryGzClothesCleaning.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Laundry.Gz.Clothes.Cleaning.RNLaundryGzClothesCleaning;` to the usings at the top of the file
  - Add `new RNLaundryGzClothesCleaningPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNLaundryGzClothesCleaning from 'react-native-laundry-gz-clothes-cleaning';

// TODO: What to do with the module?
RNLaundryGzClothesCleaning;
```
  