//::///////////////////////////////////////////////
//:: The Knower of Names, Return PC to City of Lost Souls (Action Script)
//:: H7a_Name_Return.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Return the Player to the City of Lost Souls
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Edited By: Brad Prince
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////

// Jump all henchmen as well.
void JumpAll(object oPC, object oReturn);

void main()
{
    object oReturn = GetObjectByTag("WP_Names_Return");
    object oPC = GetPCSpeaker();
    location lReturn = GetLocation(oReturn);
    location lPC = GetLocation(oPC);
    effect eVFX = EffectVisualEffect(VFX_IMP_HEALING_X);

    //Jump the player back to the Temple of the Sleeping Man.
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, lPC);
    DelayCommand(0.8, JumpAll(oPC, oReturn));
    //AssignCommand(oPC, DelayCommand(0.8, JumpToObject(oReturn)));
    DelayCommand(0.8, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, lReturn));

    //Destroy the Knower of Names.
    DestroyObject(OBJECT_SELF, 20.0);
}

// Jump all henchmen as well.
void JumpAll(object oPC, object oReturn)
{
    object oAribeth = GetObjectByTag("H2_Aribeth");
    object oDeekin = GetObjectByTag("x2_hen_deekin");
    object oNathyrra = GetObjectByTag("x2_hen_nathyra");
    object oValen = GetObjectByTag("x2_hen_valen");
    location lLoc = GetLocation(GetObjectByTag("hx_henchfinal_jump_wp"));

    AssignCommand(oPC, JumpToObject(oReturn));
    // jump all other PC's as well
    object oPlayer = GetFirstFactionMember(oPC);
    while(GetIsObjectValid(oPlayer))
    {
        AssignCommand(oPlayer, JumpToObject(oReturn));
        oPlayer = GetNextFactionMember(oPC);
    }

    if(GetIsObjectValid(oAribeth))
    {
        if(GetLocalInt(GetModule(), "bThawed") == TRUE)
        {
            if(GetIsDead(oAribeth) || GetMaster(oAribeth) == OBJECT_INVALID)
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), oAribeth);
                DelayCommand(1.0, AssignCommand(oAribeth, JumpToLocation(lLoc)));
            }
            else
            {
                DelayCommand(1.0, AssignCommand(oAribeth, JumpToObject(oReturn)));
            }
        }
    }
    if(GetIsObjectValid(oDeekin))
    {
        if(GetIsDead(oDeekin) || GetMaster(oDeekin) == OBJECT_INVALID)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), oDeekin);
            DelayCommand(1.0, AssignCommand(oDeekin, JumpToLocation(lLoc)));
        }
        else
        {
            DelayCommand(1.0, AssignCommand(oDeekin, JumpToObject(oReturn)));
        }
    }
    if(GetIsObjectValid(oNathyrra))
    {
        if(GetIsDead(oNathyrra) || GetMaster(oNathyrra) == OBJECT_INVALID)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), oNathyrra);
            DelayCommand(1.0, AssignCommand(oNathyrra, JumpToLocation(lLoc)));
        }
        else
        {
            DelayCommand(1.0, AssignCommand(oNathyrra, JumpToObject(oReturn)));
        }
    }
    if(GetIsObjectValid(oValen))
    {
        if(GetIsDead(oValen) || GetMaster(oValen) == OBJECT_INVALID)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), oValen);
            DelayCommand(1.0, AssignCommand(oValen, JumpToLocation(lLoc)));
        }
        else
        {
            DelayCommand(1.0, AssignCommand(oValen, JumpToObject(oReturn)));
        }
    }
}
