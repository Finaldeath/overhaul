//q2bn_ent_mazetrg
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    SetLocalInt(GetModule(), "nQ2BMazeTrapCount", GetLocalInt(GetModule(), "nQ2BMazeTrapCount") + 1);
}
