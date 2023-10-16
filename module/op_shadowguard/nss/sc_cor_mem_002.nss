void main()
{
    object oPC = GetPCSpeaker();

    object oCP = GetNearestObjectByTag("CT_UNIQ_NT_CRIM", oPC);

    object oOkar = GetNearestObjectByTag("CT_UNIQ_NT_OKAR", oPC);

    location l = GetLocation(oCP);

    vector p = GetPositionFromLocation(l);

    AssignCommand(oOkar, SetFacingPoint(p));
}
