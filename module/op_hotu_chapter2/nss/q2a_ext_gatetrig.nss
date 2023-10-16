//Set a variable to show that whoever is on this trigger is outside the gates..
void main()
{
    object oEnemy = GetExitingObject();
    SetLocalInt(oEnemy, "nOutsideGates", 0);
}
