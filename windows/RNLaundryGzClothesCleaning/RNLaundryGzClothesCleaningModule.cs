using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Laundry.Gz.Clothes.Cleaning.RNLaundryGzClothesCleaning
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNLaundryGzClothesCleaningModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNLaundryGzClothesCleaningModule"/>.
        /// </summary>
        internal RNLaundryGzClothesCleaningModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNLaundryGzClothesCleaning";
            }
        }
    }
}
