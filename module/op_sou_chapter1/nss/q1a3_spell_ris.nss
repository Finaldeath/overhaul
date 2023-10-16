//::///////////////////////////////////////////////
//:: q1a3_spell_ris
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Riisi will never stick around if a spell
    is cast at him...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 4/03
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{
    AssignCommand(OBJECT_SELF, SpeakStringByStrRef(40369));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(OBJECT_SELF));
    DestroyObject(OBJECT_SELF, 2.0);
}
