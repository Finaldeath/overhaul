//::///////////////////////////////////////////////
//:: m2q3H Guardian Spirit Action Script #2
//:: m2q3H_GuardianA2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script gives the player the Key of
    Judgment which is required to open the north
    door. It's okay to have multiple instances of
    the key in the gameworld.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 28, 2002
//:://////////////////////////////////////////////

void main()
{
    CreateItemOnObject("M2Q3H_JUDGEKEY", GetPCSpeaker());
}
