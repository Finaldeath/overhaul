//Destroy the choking powder
//act_q1rbecka_2
void main()
{
    object oPowder = GetLocalObject(OBJECT_SELF, "ChokingPowder");
    DestroyObject(oPowder);

}
