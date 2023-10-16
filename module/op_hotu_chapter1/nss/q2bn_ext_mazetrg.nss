//q2bn_ext_mazetrg
void main()
{
    object oPC = GetExitingObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    SetLocalInt(GetModule(), "nQ2BMazeTrapCount", GetLocalInt(GetModule(), "nQ2BMazeTrapCount") - 1);
}
