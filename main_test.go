package main

import (
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestHandler(t *testing.T) {
	req := httptest.NewRequest("GET", "/", nil)
	res := httptest.NewRecorder()

	handler(res, req)

	if res.Code != http.StatusOK {
		t.Errorf("invalid code: %d", res.Code)
	}

	t.Logf("%#v", res)
}
