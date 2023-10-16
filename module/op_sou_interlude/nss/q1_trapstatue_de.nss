// Destroy related traps

void main()
{
    object oTrap1 = GetNearestObjectByTag("X0_TRAP_MELFS", OBJECT_SELF, 1);
    object oTrap2 = GetNearestObjectByTag("X0_TRAP_MELFS", OBJECT_SELF, 2);

    DestroyObject(oTrap1);
    DestroyObject(oTrap2);
}
