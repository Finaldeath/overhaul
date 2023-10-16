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
    SetIsDestroyable(FALSE, TRUE, FALSE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), OBJECT_SELF);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneGhost(), OBJECT_SELF);
}
