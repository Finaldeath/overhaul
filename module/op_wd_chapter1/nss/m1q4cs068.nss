int StartingConditional()
{
	int l_iResult;

	l_iResult = GetTag(OBJECT_SELF) == "M1Q04CTavern01" ||
                GetTag(OBJECT_SELF) == "M1Q04CTavern03" ||
                GetTag(OBJECT_SELF) == "M1Q04CTavern05" ||
                GetTag(OBJECT_SELF) == "M1Q04CTavern07" ||
                GetTag(OBJECT_SELF) == "M1Q04CTavern09";
	return l_iResult;
}
