//::///////////////////////////////////////////////
//:: PC in Militia Guild
//:: con_fer_guildmem
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC is a member of the Militia Guild
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: September 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetFirstPC(),"OS_MILITARYGUILD")==10;
    return iResult;
}
