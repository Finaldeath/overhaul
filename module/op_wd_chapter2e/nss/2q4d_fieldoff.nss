//::///////////////////////////////////////////////
//:: Turn Off Anti-Magic Field
//:: 2Q4D_FieldOff
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Turns off the anti-magic field keeping Evaine
    from escaping.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 18, 2002
//:://////////////////////////////////////////////

void main()
{
    object oLight = GetNearestObjectByTag("2Q6H_Magic");
    if(GetIsObjectValid(oLight))
    {
       DestroyObject(oLight,0.0);
    }
}

