//::///////////////////////////////////////////////
//:: Name hx_sp_crystal
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This spawn in is for the crystal cutscenes
     in hell. It will just spawn people in dead.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 24, 2003
//:://////////////////////////////////////////////

void main()
{
    object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);

    SetIsDestroyable(FALSE, FALSE, FALSE);
    //ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GLOW_GREY), OBJECT_SELF);
    //DelayCommand(1.0, ActionAttack(oEnemy));
}
