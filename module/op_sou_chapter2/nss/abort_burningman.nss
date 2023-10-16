//::///////////////////////////////////////////////
//:: Burning Man (Conversation End/Abort)
//:: Abort_BurningMan.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle the Burning Man's fire, random walk,
     and the firing of the UD.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 11, 2003
//:://////////////////////////////////////////////

void main()
{
    //Fire my AoE spell.
    ActionCastFakeSpellAtObject(SPELL_WALL_OF_FIRE, OBJECT_SELF);
    DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectAreaOfEffect(AOE_PER_WALLFIRE, "crypt02_en_firew", "crypt02_hb_firew"), GetLocation(OBJECT_SELF), 12.0));

    //Start moving again
    ActionRandomWalk();
}
