//::///////////////////////////////////////////////
//:: Name: q2d2_allfriends
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    All Mindflayers, Hulks and non-freed slaves
    go friendly to the PC
    Need to go through each area and do this...

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 1/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void MakeFriendly(object oArea);

void main()
{
    //Make Friendly Zorvak Mur - the Slave Pens and the Entrance Caverns
    object oArea;
    object oZorvakMur = GetObjectByTag("wp_q2dzorvakmur");
    oArea = GetArea(oZorvakMur);
    MakeFriendly(oArea);
    object oEntrance = GetObjectByTag("wp_q2dentrance");
    oArea = GetArea(oEntrance);
    MakeFriendly(oArea);
    object oSlavePens = GetObjectByTag("wp_q2dslavepens");
    oArea = GetArea(oSlavePens);
    MakeFriendly(oArea);
}
void MakeFriendly(object oArea)
{
    //Faction Boy creature (in the tavern)
    object oFactionBase = GetObjectByTag("q2d_factionbase");

    string szTag;
    //Cycle through all creatures changing them to the neutral mindflayer faction
    object oCreature = GetFirstObjectInArea(oArea);
    while (GetIsObjectValid(oCreature) == TRUE)
    {
        if (GetObjectType(oCreature) == OBJECT_TYPE_CREATURE)
        {
            szTag = GetTag(oCreature);
            //Set them to Neutral
            if (GetStringLeft(szTag, 7) == "q2d_ill" || szTag == "q2dgatekeeper")
            {
                AssignCommand(oCreature, ClearAllActions(TRUE));
                ChangeFaction(oCreature, oFactionBase);
            }//check slaves
            else if (GetStringLeft(szTag, 7) == "q2dthra")
            {
                // if not freed - they help the mindflayers - go neutral
                if (GetLocalInt(oCreature, "nFreed") == 0)
                {
                    AssignCommand(oCreature, ClearAllActions(TRUE));
                    ChangeFaction(oCreature, oFactionBase);
                }
                //if they are freed, they are fighting
                else
                {
                    //ChangeToStandardFaction(oCreature, STANDARD_FACTION_HOSTILE);
                    //AssignCommand(oCreature, DetermineCombatRound());
                }

            }
        }
        oCreature = GetNextObjectInArea(oArea);
    }
}
