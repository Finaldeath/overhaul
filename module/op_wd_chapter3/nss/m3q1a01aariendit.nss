//::///////////////////////////////////////////////
//:: Ends the module
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    <> Loads Chapter 4
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: November 20 2001
//:://////////////////////////////////////////////
#include "nw_i0_henchman"
#include "m3plotinclude"
void main()
{
//   SpeakString("The module is now over.  If all was well in the world, you would be taken to Chapter 4.  But I am sadly lacking in my ability to do that as of right now.  Go back Scott.");
    StripAllPersonalItemsFromEveryone();
    DelayCommand(0.5,RestoreEveryone());
    // * have to delay this so that there is time to strip all the items
    DelayCommand(1.0,StartNewModule("Chapter4"));
}
