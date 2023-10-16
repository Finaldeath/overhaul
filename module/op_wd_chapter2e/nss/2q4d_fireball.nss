//::///////////////////////////////////////////////
//:: Ballista Fireball Script
//:: 2Q4D_Fireball
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Causes the ballistas on each ship to fire at
    enemy targets on the docks.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 5,2002
//:://////////////////////////////////////////////

#include "NW_I0_2Q4LUSKAN"
void main()
{
    int nLocal = GetLocalPlotIntFromCharacter(OBJECT_SELF);
    int nFire = GetLocalInt(GetArea(OBJECT_SELF), "NW_2Q6D_FIRE_BARRAGE");
    if(nFire == 10)
    {
    //    if(nLocal == TRUE)
    //    {
            int nRand = d10();
            string sTag;
            if(nRand == 10)
            {
                sTag = "2Q6D_BARRAGE_10";
            }
            else
            {
                sTag = "2Q6D_BARRAGE_0" + IntToString(nRand);
            }
            object oWay = GetWaypointByTag(sTag);
            location lWay = GetLocation(oWay);
            ActionCastSpellAtLocation(SPELL_FIREBALL, lWay, METAMAGIC_NONE, TRUE, PROJECTILE_PATH_TYPE_BALLISTIC);
            SetLocalPlotIntOnCharacter(OBJECT_SELF, FALSE);
            ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
            DelayCommand(1.0, ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
    //    }
    //    else
    //    {
    //        SetLocalPlotIntOnCharacter(OBJECT_SELF, TRUE);
    //    }
    }
}
