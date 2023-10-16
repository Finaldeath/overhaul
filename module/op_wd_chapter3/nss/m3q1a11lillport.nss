//::///////////////////////////////////////////////
//:: Lillian Gives Teleportation Scroll
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:   Brent
//:: Created On:   November 2001
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
   SetLocalInt(GetPCSpeaker(),"SNOW_TALK_LILLIAN",1);

   if (HasItem(GetPCSpeaker(),"M3ALL_MAGSCROLL") == FALSE)
   {
    CreateItemOnObject("M3ALL_MAGSCROLL",GetPCSpeaker());
   }
}
