//Display a text string about the sleeping kings room
//for the first pc in
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
        FloatingTextStrRefOnCreature(84125 , oPC);
        DelayCommand(3.0, FloatingTextStrRefOnCreature(84126 ,oPC));
    }
}
