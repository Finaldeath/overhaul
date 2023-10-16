//::///////////////////////////////////////////////
//:: Name act_q1aayala_3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        Remove effects from Drogan
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On: Feb 4/03
//:://////////////////////////////////////////////

void main()
{
    object oDrogan = GetObjectByTag("Drogan");
    SetCommandable(TRUE, oDrogan);
    effect eEff1 = GetFirstEffect(oDrogan);
    while(GetIsEffectValid(eEff1))
    {
        RemoveEffect(oDrogan, eEff1);
        eEff1 = GetNextEffect(oDrogan);
    }
    AssignCommand(oDrogan, SetFacingPoint(GetPosition(GetObjectByTag("Ayala"))));
    SetPlotFlag(oDrogan, FALSE);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDazed(), oDrogan);
    SetPlotFlag(oDrogan, TRUE);

}
