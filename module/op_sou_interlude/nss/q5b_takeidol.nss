// the minister takes the idol away

void main()
{
    object oIdol = GetItemPossessedBy(GetPCSpeaker(), "q5b_idol");
    DestroyObject(oIdol);
}
