

void main()
{
    object oCultist1 = GetNearestObjectByTag("q3a_cultist1");
    SetLocalInt(OBJECT_SELF, "TALK_STARTED", 1);
    SetFacingPoint(GetPosition(oCultist1));
}
