//::///////////////////////////////////////////////
//:: Manticore Trap lever
//:: q3h_mantilever
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Lever for the manticore trap
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oDoor1 = GetObjectByTag("q3h_mantitrap",0);
    object oDoor2 = GetObjectByTag("q3h_mantitrap",1);
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    if(GetLocalInt(oDoor1,"OS_MANTILEVER")==0)
    {
        SetLocalInt(oDoor1,"OS_MANTILEVER",10);
        SetLocked(oDoor1,FALSE);
        SetLocked(oDoor2,FALSE);
        AssignCommand(oDoor1,ActionOpenDoor(oDoor1));
        AssignCommand(oDoor2,ActionOpenDoor(oDoor2));
    }
    else
    {
        object oBarrel1 = GetObjectByTag("q3h_gem_barrel",0);
        object oBarrel2 = GetObjectByTag("q3h_gem_barrel",1);
        object oGem1 = GetItemPossessedBy(oBarrel1,"q3_poisoncrystal");
        object oGem2 = GetItemPossessedBy(oBarrel2,"q3_poisoncrystal");
        object oTrig = GetObjectByTag("q3_trg_manticore");
        object oPC = GetLastUsedBy();
        object oWay = GetNearestObjectByTag("q3_way_mantlever");
        SetLocalInt(oDoor1,"OS_MANTILEVER",0);
        SetLocked(oDoor1,TRUE);
        SetLocked(oDoor2,TRUE);
        AssignCommand(oDoor1,ActionCloseDoor(oDoor1));
        AssignCommand(oDoor2,ActionCloseDoor(oDoor2));
        AssignCommand(oPC,ActionJumpToObject(oWay));
        if(GetIsObjectValid(oGem1)
            && GetIsObjectValid(oGem2)
            && GetLocalInt(oTrig,"OS_MANTICORE")==10)
        {
            object oLeviosa = GetObjectByTag("q2_leviosa");
            object oManticore = GetObjectByTag("q3_manticore");
            effect eDam = EffectDamage(1000,DAMAGE_TYPE_ACID);
            SetLocalInt(GetModule(), "os_manticorehunt",15);
            effect eVis = EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_ACID);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oBarrel1);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oBarrel2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oManticore);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDam,oManticore);
            SetPlotFlag(oBarrel1,FALSE);
            SetPlotFlag(oBarrel2,FALSE);
            DelayCommand(0.1,DestroyObject(oGem1));
            DelayCommand(0.1,DestroyObject(oGem2));
            DelayCommand(0.1,DestroyObject(oBarrel1));
            DelayCommand(0.1,DestroyObject(oBarrel2));
        }
    }
}
