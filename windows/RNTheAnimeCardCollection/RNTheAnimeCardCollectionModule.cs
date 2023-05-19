using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace The.Anime.Card.Collection.RNTheAnimeCardCollection
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNTheAnimeCardCollectionModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNTheAnimeCardCollectionModule"/>.
        /// </summary>
        internal RNTheAnimeCardCollectionModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNTheAnimeCardCollection";
            }
        }
    }
}
