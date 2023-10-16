//::///////////////////////////////////////////////
//:: q1a3_attack_ris
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*


    Riisi will dissappear if attacked
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 4/03
//:://////////////////////////////////////////////



void main()
{

    AssignCommand(OBJECT_SELF, SpeakStringByStrRef(40375));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(OBJECT_SELF));
    DestroyObject(OBJECT_SELF, 2.0);
}
