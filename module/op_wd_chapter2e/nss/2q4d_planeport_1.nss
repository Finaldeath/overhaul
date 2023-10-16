//::///////////////////////////////////////////////
//:: Planer Portal Heartbeat
//:: 2Q4D_PlanePort_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if there is a Succubus, Hellhound
    and Imp in the main room.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamanuik
//:: Created On: Feb 17, 2002
//:://////////////////////////////////////////////
 #include "NW_I0_2Q4LUSKAN"
void main()
{
    int nPortal = GetLocalPlotIntFromCharacter(OBJECT_SELF);
    object oPlanarSpawn = GetWaypointByTag("2Q4D_PlanarSpawn");
    location lWay = GetLocation(oPlanarSpawn);
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    if(GetIsObjectValid(oPC) && GetDistanceToObject(oPC) > 10.0)
    {
        if(nPortal == 3)
        {
            object oImp = GetObjectByTag("2Q4D_Imp", 2);
            object oSuccubus = GetObjectByTag("2Q4D_Succubus", 2);
            object oHellHound = GetObjectByTag("2Q4D_HellHound", 3);
            effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1);
            string sTemplate = "";

            if(!GetIsObjectValid(oImp))
            {
                sTemplate = "2Q4D_Imp";
            }
            else if(!GetIsObjectValid(oHellHound))
            {
                sTemplate = "2Q4D_HellHound";
            }
            else if(!GetIsObjectValid(oSuccubus))
            {
                sTemplate = "2Q4D_Succubus";
            }

            if(sTemplate != "")
            {
                DelayCommand(0.5, CreateObjectVoid(OBJECT_TYPE_CREATURE, sTemplate, lWay));
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lWay);
            }
            SetLocalPlotIntOnCharacter(OBJECT_SELF, 0);
        }
        else
        {
            nPortal++;
            SetLocalPlotIntOnCharacter(OBJECT_SELF, nPortal);
        }
    }
}


