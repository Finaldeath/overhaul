void main()
{
    object oPC = GetPCSpeaker();

    SetLocalInt(oPC, "N_ST_0_BLOOD_OFFERING", 3);

    AdjustAlignment(oPC, ALIGNMENT_EVIL, 5);

    object oDeer = GetNearestObjectByTag("CT_UNIQ_NT_S0DR");

    DestroyObject(oDeer, 1.0);
}
