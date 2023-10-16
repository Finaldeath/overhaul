// failing to open weapon-spirit door:
// check to see if the spirit is still there and if not then open the door

void main()
{
    object oSpirit = GetObjectByTag("q4b_WeaponSpirit");
    if(oSpirit == OBJECT_INVALID || GetIsDead(oSpirit))
    {
        SetLocked(OBJECT_SELF, FALSE);
        ActionOpenDoor(OBJECT_SELF);
    }
}
