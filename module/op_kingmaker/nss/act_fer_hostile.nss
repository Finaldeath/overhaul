//::///////////////////////////////////////////////
//:: Feran goes hostile
//:: act_fer_hostile
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Feran attacks the player
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    //remove Feran's immortal flag,
    //make sure he is different faction than anyone else,
    object oPC = GetFirstPC();
    SetPlotFlag(OBJECT_SELF,FALSE);
    SetImmortal(OBJECT_SELF,FALSE);
    ChangeToStandardFaction(OBJECT_SELF,STANDARD_FACTION_HOSTILE);
    ActionAttack(oPC);
}
