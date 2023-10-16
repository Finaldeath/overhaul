//q2a_ent_ledge
//Set a variable on the Enterer so that we know the object is on a ledge
void main()
{
    object oCreature = GetEnteringObject();
    SetLocalInt(oCreature, "Q2A_OnLedge", 1);

}
