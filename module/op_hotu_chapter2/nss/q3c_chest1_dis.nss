//::///////////////////////////////////////////////
//:: Golem door spectacular opening
//:: q3c_chest1_dis
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Simply send beams from the statue above the chest to the 3 doors,
     open them and tell the golems to attack.
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron.
//:: Created On: 23/1/2003
//:://////////////////////////////////////////////

// Fires beam from oSource to oDoor, opens oDoor and sends the golem to attack oPC
void FireBeam(object oSource, object oDoor, object oPC);

void main()
{
    object oOrb = GetInventoryDisturbItem();
    if(GetInventoryDisturbType() != INVENTORY_DISTURB_TYPE_REMOVED)
        return;
    object oPC = GetLastDisturbed();
    if(GetTag(oOrb) != "Q3C_ChargedOrb")
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oBeam1 = GetNearestObjectByTag("Q3C_GOLEM_BEAM1");
    object oBeam2 = GetNearestObjectByTag("Q3C_GOLEM_BEAM2");
    object oBeam3 = GetNearestObjectByTag("Q3C_GOLEM_BEAM3");

    object oDoor1 = GetNearestObjectByTag("Q3C_DOOR_GOLEM1");
    object oDoor2 = GetNearestObjectByTag("Q3C_DOOR_GOLEM2");
    object oDoor3 = GetNearestObjectByTag("Q3C_DOOR_GOLEM3");

    FireBeam(oBeam1, oDoor1, oPC);
    FireBeam(oBeam2, oDoor2, oPC);
    FireBeam(oBeam3, oDoor3, oPC);

}

void FireBeam(object oSource, object oDoor, object oPC)
{
    // Setting up beam effect
    effect eBeam = EffectBeam(VFX_BEAM_ODD, oSource, BODY_NODE_CHEST);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oDoor, 1.50);
    // Opening the door
    SetPlotFlag(oDoor, FALSE);
    SetLocked(oDoor, FALSE);
    DelayCommand(1.50, AssignCommand(oDoor, ActionOpenDoor(oDoor)));
    // Sending the golem
    object oGolem = GetNearestObjectByTag("NW_GOLIRON", oDoor);
    DelayCommand(1.75, AssignCommand(oGolem, ActionAttack(oPC)));
}
