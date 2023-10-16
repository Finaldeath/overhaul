//::///////////////////////////////////////////////
//:: Name act_q2a3svirf_5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
The two toughs leave the area
and the svirf dies
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 25/03
//:://////////////////////////////////////////////

void main()
{

    object oSvirf = GetObjectByTag("q2a3svirf");
    SetPlotFlag(oSvirf, FALSE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oSvirf);

    object oTough1 = GetObjectByTag("q2abartough1");
    object oTough2 = GetObjectByTag("q2abartough2");

    object oDoor = GetWaypointByTag("wp_svirfdrinkend");
    AssignCommand(oTough1, ActionMoveToObject(oDoor));
    DelayCommand(4.5, SetPlotFlag(oTough1, FALSE));
    DestroyObject(oTough1, 5.0);
    DelayCommand(0.5, SetCommandable(FALSE, oTough1));

    AssignCommand(oTough2, ActionMoveToObject(oDoor));
    DelayCommand(4.5, SetPlotFlag(oTough2, FALSE));
    DestroyObject(oTough2, 5.0);
    DelayCommand(0.5, SetCommandable(FALSE, oTough2));


}
