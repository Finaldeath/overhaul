// Plate puzzle:
// Whenever using the plate - switch to the next rune. When all plates in the line
// are the same, this line is locked. When all 4 lines are locked - the obelisk is disabled.

void main()
{
    // The area handles the changing of runes as it required the destruction of this object
    SetLocalObject(GetArea(OBJECT_SELF), "CURRENT_RUNE", OBJECT_SELF);
    SetLocalObject(GetArea(OBJECT_SELF), "PC", GetLastUsedBy());
    SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(102));
}
