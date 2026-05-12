<?php
declare(strict_types=1);

namespace App\Controller;

class ArticlesController extends AppController
{
    public function index()
    {
        $articles = $this->Articles->find()->all();
        $this->set(compact('articles'));
    }

    public function view($slug = null)
    {
        $article = $this->Articles
            ->findBySlug($slug)
            ->firstOrFail();

        $this->set(compact('article'));
    }

    public function add()
    {
        $article = $this->Articles->newEmptyEntity();

        if ($this->request->is('post')) {
            $article = $this->Articles->patchEntity(
                $article,
                $this->request->getData()
            );

            if ($this->Articles->save($article)) {
                $this->Flash->success('Article saved!');

                return $this->redirect(['action' => 'index']);
            }

            $this->Flash->error('Unable to save article.');
        }

        $this->set(compact('article'));
    }

    public function edit($id = null)
    {
        $article = $this->Articles->get($id);

        if ($this->request->is(['patch', 'post', 'put'])) {

            $article = $this->Articles->patchEntity(
                $article,
                $this->request->getData()
            );

            if ($this->Articles->save($article)) {

                $this->Flash->success('The article has been saved.');

                return $this->redirect(['action' => 'index']);
            }

            $this->Flash->error(
                'The article could not be saved. Please try again.'
            );
        }

        $this->set(compact('article'));
    }

    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);

        $article = $this->Articles->get($id);

        if ($this->Articles->delete($article)) {

            $this->Flash->success('The article has been deleted.');

        } else {

            $this->Flash->error(
                'The article could not be deleted. Please try again.'
            );
        }

        return $this->redirect(['action' => 'index']);
    }
}