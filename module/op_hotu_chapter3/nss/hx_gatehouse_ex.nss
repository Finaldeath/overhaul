//::///////////////////////////////////////////////
//:: Name: hx_gatehouse_ex
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Destroy any henchmen that are flagged as dead.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 25, 2003
//:://////////////////////////////////////////////

void PurgeDead()
{
    object oAribeth = GetObjectByTag("H2_Aribeth");
    object oNathyrra = GetObjectByTag("x2_hen_nathyra");
    object oDeekin = GetObjectByTag("x2_hen_deekin");
    object oValen = GetObjectByTag("x2_hen_valen");

    if(GetLocalInt(oAribeth, "HX_FLAGGED_DEAD") == TRUE)
    {
        if(GetPlotFlag(oAribeth))
        {
            SetPlotFlag(oAribeth, FALSE);
        }
        if(GetImmortal(oAribeth))
        {
            SetImmortal(oAribeth, FALSE);
        }
        AssignCommand(oAribeth, SetIsDestroyable(TRUE, FALSE, FALSE));
        DestroyObject(oAribeth, 1.0);
    }
    if(GetLocalInt(oNathyrra, "HX_FLAGGED_DEAD") == TRUE)
    {
        if(GetPlotFlag(oNathyrra))
        {
            SetPlotFlag(oNathyrra, FALSE);
        }
        if(GetImmortal(oNathyrra))
        {
            SetImmortal(oNathyrra, FALSE);
        }
        AssignCommand(oNathyrra, SetIsDestroyable(TRUE, FALSE, FALSE));
        DestroyObject(oNathyrra, 1.0);
    }
    if(GetLocalInt(oDeekin, "HX_FLAGGED_DEAD") == TRUE)
    {
        if(GetPlotFlag(oDeekin))
        {
            SetPlotFlag(oDeekin, FALSE);
        }
        if(GetImmortal(oDeekin))
        {
            SetImmortal(oDeekin, FALSE);
        }
        AssignCommand(oDeekin, SetIsDestroyable(TRUE, FALSE, FALSE));
        DestroyObject(oDeekin, 1.0);
    }
    if(GetLocalInt(oValen, "HX_FLAGGED_DEAD") == TRUE)
    {
        if(GetPlotFlag(oValen))
        {
            SetPlotFlag(oValen, FALSE);
        }
        if(GetImmortal(oValen))
        {
            SetImmortal(oValen, FALSE);
        }
        AssignCommand(oValen, SetIsDestroyable(TRUE, FALSE, FALSE));
        DestroyObject(oValen, 1.0);
    }
}

void main()
{
    object oPC = GetExitingObject();

    if(GetIsPC(oPC))
    {
        DoSinglePlayerAutoSave();
        DestroyObject(GetObjectByTag("D" + GetName(GetPCSpeaker())));
        DestroyObject(GetObjectByTag("L" + GetName(GetPCSpeaker())));
        SetLocalInt(oPC,"NW_PCINHELL",0);

        PurgeDead();
    }
}
