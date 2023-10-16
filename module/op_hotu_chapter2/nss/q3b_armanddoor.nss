// signal Armand to buff himself

void main()
{
    object oArmand = GetNearestObjectByTag("q3_armand");
    SignalEvent(oArmand, EventUserDefined(101));
}
