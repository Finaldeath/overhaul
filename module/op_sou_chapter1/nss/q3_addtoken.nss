// a token is added to the pool

void main()
{
    object oToken = GetItemPossessedBy(GetPCSpeaker(), "Q3B_TOKEN");
    DestroyObject(oToken);

    int nToken = GetLocalInt(OBJECT_SELF,"q3_Tokens_Thrown");
    SetLocalInt(OBJECT_SELF, "q3_Tokens_Thrown", (nToken + 1));
}
