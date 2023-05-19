
# react-native-the-anime-card-collection

## Getting started

`$ npm install react-native-the-anime-card-collection --save`

### Mostly automatic installation

`$ react-native link react-native-the-anime-card-collection`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-the-anime-card-collection` and add `RNTheAnimeCardCollection.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNTheAnimeCardCollection.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNTheAnimeCardCollectionPackage;` to the imports at the top of the file
  - Add `new RNTheAnimeCardCollectionPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-the-anime-card-collection'
  	project(':react-native-the-anime-card-collection').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-the-anime-card-collection/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-the-anime-card-collection')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNTheAnimeCardCollection.sln` in `node_modules/react-native-the-anime-card-collection/windows/RNTheAnimeCardCollection.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using The.Anime.Card.Collection.RNTheAnimeCardCollection;` to the usings at the top of the file
  - Add `new RNTheAnimeCardCollectionPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNTheAnimeCardCollection from 'react-native-the-anime-card-collection';

// TODO: What to do with the module?
RNTheAnimeCardCollection;
```
  