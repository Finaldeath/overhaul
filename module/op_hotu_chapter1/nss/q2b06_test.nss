void main ()
{
 object oDoor = GetObjectByTag("x2_reapdoor");
 vector vDoor = GetPosition(oDoor);
 vector vNewDoor = Vector(vDoor.x, vDoor.y, vDoor.z - 1.5);
 location lDoor = Location(GetArea(OBJECT_SELF), vNewDoor, GetFacing(oDoor));
 DestroyObject(oDoor);
 object oNewDoor = CreateObject(OBJECT_TYPE_PLACEABLE, "x2_reapdoor", lDoor, TRUE);
 AssignCommand(oNewDoor, ActionPlayAnimation(ANIMATION_PLACEABLE_OPEN));
//AssignCommand(GetLastUsedBy(), ActionJumpToObject(GetWaypointByTag("wp_reaperrealm")));
}

