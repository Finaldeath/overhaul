void main()
{
    object oHench = CreateObject(OBJECT_TYPE_CREATURE, "x0_hen_dor", GetLocation(GetFirstPC()));
    SetPlotFlag(oHench, FALSE);
    SetImmortal(oHench, FALSE);
}
