//::///////////////////////////////////////////////
//:: Fire Magic Missile
//:: 2Q6C_Missiles
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Targets the closest creature and fires a
    spread of magic missiles.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 24, 2002
//:://////////////////////////////////////////////

void main()
{
    int nLocal = GetLocalInt(GetArea(OBJECT_SELF), "NW_2Q6C_MAGIC_TRAINING");
    if(nLocal == 1)
    {
        object oTarget = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
        if(GetIsObjectValid(oTarget))
        {
            ActionCastSpellAtObject(SPELL_MAGIC_MISSILE, oTarget, METAMAGIC_ANY, TRUE);
        }
    }
}
