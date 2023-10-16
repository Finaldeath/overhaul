//::///////////////////////////////////////////////
//:: M3_AARIN_END
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Ends the chapter or moves Aarin back to his
    position.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    May 2002
//:://////////////////////////////////////////////
#include "m3plotinclude"
#include "nw_i0_henchman"
#include "nw_i0_plot"
void main()
{
    if(GetLocalInt(GetModule(),"NW_G_CHAPTER3OVER")==1)
    {
        StripAllPersonalItemsFromEveryone();
        // * have to delay this so that there is time to strip all the items
        DelayCommand(0.5,RestoreEveryone());
        DelayCommand(1.0,StartNewModule("Chapter4"));
    }
    else
    {
        ActionMoveToObject(GetNearestObjectByTag("WP_Return_" + GetTag(OBJECT_SELF)));
        if(GetTag(OBJECT_SELF) == "AARINGEND3Q11")
        {
            PlayOldTheme();
        }
    }
}
