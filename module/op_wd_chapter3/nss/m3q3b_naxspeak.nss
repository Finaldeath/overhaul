//::///////////////////////////////////////////////
//:: M3Q3B_NAXSPEAK
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gets Nax to call for help the first time he sees the player.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    if(GetIsPC(oPC))
    {
        if(GetLocalInt(oPC,"NW_L_M3Q3B_SEENAX")==0)
        {
            object oNax = GetObjectByTag("Nax");
            AssignCommand(oNax,ActionSpeakStringByStrRef(66124));
            SetLocalInt(oPC,"NW_L_M3Q3B_SEENAX",1);
        }
    }
}
