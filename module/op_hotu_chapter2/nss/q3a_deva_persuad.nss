//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Deva: Persuaded (Action Script)
//:: Q3a_Deva_Persuad.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as having Persuaded the deva
     to continue her mission.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 27, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "Q3_Deva_Persuaded", TRUE);
}
