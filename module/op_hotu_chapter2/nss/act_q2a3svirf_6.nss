//::///////////////////////////////////////////////
//:: Name act_q2a3svirf_6
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    the svirf dies
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


}
