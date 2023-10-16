//::///////////////////////////////////////////////
//:: Name q4a_oxspawn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script leaves an ox corpse behind for
     effect.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 3, 2003
//:://////////////////////////////////////////////
void main()
{
   SetIsDestroyable(FALSE, FALSE, FALSE);
   ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), OBJECT_SELF);
}
